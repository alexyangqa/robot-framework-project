# Project Title

![Smoke Tests](https://github.com/alexyangqa/robot-framework-project/actions/workflows/ci-smoke.yml/badge.svg)
![Nightly Regression](https://github.com/alexyangqa/robot-framework-project/actions/workflows/scheduled-regression.yml/badge.svg)

This project uses Robot Framework for automated testing.

🚀 Robot Framework Automation Suite (Sydney)
A professional-grade Selenium automation framework built with Robot Framework, featuring a dual-layer CI/CD pipeline, headless execution, and self-healing retry logic.

🏗️ Project Architecture
Language: Python 3.11+

Tool: Robot Framework / SeleniumLibrary

IDE: PyCharm

CI/CD: GitHub Actions (Sydney Timezone Optimized)

Browsers: Chrome (Incognito & Headless supported)

🛠️ Setup & Installation
Clone the repository:

Bash
git clone https://github.com/YOUR_USERNAME/YOUR_REPO.git
cd YOUR_REPO
Create and Activate Virtual Environment:

Bash
python -m venv venv
source venv/bin/activate  # Mac/Linux
# OR
venv\Scripts\activate     # Windows
Install Dependencies:

Bash
python -m pip install --upgrade pip
pip install -r requirements.txt
🧪 Running Tests
Local Execution (Headed)

To run tests on your local machine with a visible browser:

Bash
robot --variable browser_name:chrome --include smoke tests/
Pipeline Execution (Headless)

The framework is configured to automatically handle headless mode in the CI environment. To mimic this locally:

Bash
robot --variable browser_name:headlesschrome --include smoke tests/
🚀 CI/CD Pipeline Strategy
We utilize a smart-tagging strategy to balance speed and coverage:

Workflow	Trigger	Focus
CI - Smoke	Push / Pull Request	Critical path verification (Fast feedback)
Nightly Regression	Daily @ 2:00 AM AEST	Full system validation
Manual Run	workflow_dispatch	Pre-release or ad-hoc verification
🛡️ Stability & Self-Healing
Incognito Mode: All tests run in incognito to prevent password-leak popups and cache interference.

Retry Logic: The pipeline includes a --rerunfailed step to eliminate "flaky" failures caused by network glitches.

Headless Optimization: Includes --no-sandbox and --disable-dev-shm-usage for stable execution on Linux servers.

📊 Reporting
Test results (HTML logs and screenshots) are archived in GitHub Actions for 7 days.

To view: Go to Actions -> Select Run -> Artifacts.