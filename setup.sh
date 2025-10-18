#!/usr/bin/env bash
set -e

echo "🔧 Setting up OPM development environment..."

# 1. Check Python
if ! command -v python3 &>/dev/null; then
  echo "❌ Python 3 not found. Please install Python 3.10+ first."
  exit 1
fi

# 2. Create venv if not exists
if [ ! -d ".venv" ]; then
  echo "📦 Creating virtual environment (.venv)..."
  python3 -m venv .venv
else
  echo "ℹ️  Virtual environment already exists (.venv)."
fi

# 3. Activate venv
echo "🚀 Activating virtual environment..."
source .venv/bin/activate

# 4. Upgrade pip & install
echo "📦 Installing dependencies..."
pip install --upgrade pip
pip install -e .

# 5. Test OPM CLI
echo "✅ Verifying OPM installation..."
if command -v opm &>/dev/null; then
  opm --help
  echo "🎉 OPM is ready to use!"
else
  echo "⚠️  OPM command not found. Try running: source .venv/bin/activate"
fi