#/bin/bash
REPO_DIR=$PWD

echo Creating virtual environment from python3
virtualenv -p python3 $PWD/venv

$REPO_DIR/venv/bin/pip install -r requirements.txt
sed -i "s+REPO_DIR+${REPO_DIR}+g" test_file.txt
sudo ln -s $REPO_DIR/power_button.service /etc/systemd/system/power_button.service
sudo systemctl enable power_button.service
sudo systemctl daemon-reload
echo done


