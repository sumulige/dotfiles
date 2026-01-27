#!/usr/bin/env node
/**
 * Sumulige Dotfiles CLI
 *
 * Usage:
 *   npx @sumulige/dotfiles [command]
 *
 * Commands:
 *   install [level]  - Install dotfiles (core|tools|full|sync)
 *   update          - Update dotfiles from git
 *   help            - Show this help
 */

const { execSync, spawn } = require('child_process');
const path = require('path');
const fs = require('fs');
const os = require('os');

// 颜色
const colors = {
  reset: '\x1b[0m',
  blue: '\x1b[34m',
  green: '\x1b[32m',
  yellow: '\x1b[33m',
  red: '\x1b[31m',
};

const print = {
  step: (msg) => console.log(`${colors.blue}➜${colors.reset} ${msg}`),
  success: (msg) => console.log(`${colors.green}✓${colors.reset} ${msg}`),
  warning: (msg) => console.log(`${colors.yellow}⚠${colors.reset} ${msg}`),
  error: (msg) => console.log(`${colors.red}✗${colors.reset} ${msg}`),
};

// 配置
const REPO_URL = 'https://github.com/sumulige/dotfiles.git';
const DOTFILES_DIR = path.join(os.homedir(), 'Documents', 'dotfiles');

function showHelp() {
  console.log(`
${colors.blue}Sumulige Dotfiles CLI${colors.reset}

Usage:
  sumulige-dotfiles [command] [options]

Commands:
  install [level]  Install dotfiles
                   Levels: core, tools, full (default), sync
  update           Update dotfiles from git
  help             Show this help

Examples:
  sumulige-dotfiles              # Full install
  sumulige-dotfiles install core # Core packages only
  sumulige-dotfiles update       # Update existing installation
`);
}

function runCommand(cmd, options = {}) {
  try {
    execSync(cmd, { stdio: 'inherit', ...options });
    return true;
  } catch (error) {
    return false;
  }
}

function install(level = 'full') {
  console.log(`
${colors.blue}========================================${colors.reset}
${colors.blue}   Sumulige Dotfiles 安装${colors.reset}
${colors.blue}========================================${colors.reset}
`);

  // 检查 Git
  try {
    execSync('git --version', { stdio: 'pipe' });
  } catch {
    print.error('Git 未安装，请先安装 Git');
    process.exit(1);
  }

  // 克隆或更新
  if (fs.existsSync(DOTFILES_DIR)) {
    print.warning(`目录已存在: ${DOTFILES_DIR}`);
    print.step('正在更新...');
    runCommand('git pull --rebase', { cwd: DOTFILES_DIR });
  } else {
    print.step(`克隆仓库到 ${DOTFILES_DIR}...`);
    fs.mkdirSync(path.dirname(DOTFILES_DIR), { recursive: true });
    runCommand(`git clone ${REPO_URL} "${DOTFILES_DIR}"`);
  }

  // 运行安装脚本
  print.step(`运行安装脚本 (level: ${level})...`);
  const installScript = path.join(DOTFILES_DIR, 'install.sh');
  runCommand(`chmod +x "${installScript}"`);

  // 使用 spawn 以便实时输出
  const child = spawn('bash', [installScript, level], {
    cwd: DOTFILES_DIR,
    stdio: 'inherit',
  });

  child.on('close', (code) => {
    if (code === 0) {
      console.log(`
${colors.green}========================================${colors.reset}
${colors.green}   安装完成！${colors.reset}
${colors.green}========================================${colors.reset}

Dotfiles 已安装到: ${DOTFILES_DIR}

快速命令:
  cd ${DOTFILES_DIR}   # 进入配置目录
  ./install.sh sync    # 同步配置
  git pull             # 更新配置
`);
    }
    process.exit(code);
  });
}

function update() {
  if (!fs.existsSync(DOTFILES_DIR)) {
    print.error(`Dotfiles 未安装: ${DOTFILES_DIR}`);
    print.step('运行 sumulige-dotfiles install 先安装');
    process.exit(1);
  }

  print.step('更新 dotfiles...');
  runCommand('git pull --rebase', { cwd: DOTFILES_DIR });
  print.step('同步配置...');
  runCommand('./sync.sh', { cwd: DOTFILES_DIR });
  print.success('更新完成！');
}

// 主入口
const args = process.argv.slice(2);
const command = args[0] || 'install';

switch (command) {
  case 'install':
    install(args[1] || 'full');
    break;
  case 'update':
    update();
    break;
  case 'help':
  case '--help':
  case '-h':
    showHelp();
    break;
  default:
    // 如果是 level 参数，当作 install 处理
    if (['core', 'tools', 'full', 'sync'].includes(command)) {
      install(command);
    } else {
      print.error(`未知命令: ${command}`);
      showHelp();
      process.exit(1);
    }
}
