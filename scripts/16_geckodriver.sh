# get gecko driver for web scraping
echo installing geck driver


# download gecko driver
cd ~/Downloads

wget https://github.com/mozilla/geckodriver/releases/download/v0.30.0/geckodriver-v0.30.0-linux32.tar.gz

# unpack and install
tar -xvzf *.tar.gz
sudo mv geckodriver /usr/bin/geckodriver
sudo chown root:root /usr/bin/geckodriver
sudo chmod +x /usr/bin/geckodriver

trash *.tar.gz

# make firefox profile to set what happens to downloads
# we want them to automatically download to downloads folder


# close firefox 
# firefox -p

# make a profile called 'scrape'
# profile = 'scrape'
# set csv type to always download
# download wordpress csv and select always download

