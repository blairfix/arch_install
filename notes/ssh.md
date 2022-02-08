# ssh notes 

# instructions for remote key gen
ssh-keygen -t rsa

# emily laptop key
/home/blair/.ssh/emily_laptop
    
# save in /home/blair/.ssh/allseries
# send key to allseries
cat ~/.ssh/allseries.pub | ssh -p 1497 blair@192.168.0.104 'cat >> .ssh/authorized_keys'

# after keygen transfer set
PasswordAuthentication no
UsePAM yes

# emily laptop script info
# stored on laptop in:
emily/scripts

