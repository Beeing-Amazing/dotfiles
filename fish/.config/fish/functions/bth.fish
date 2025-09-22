function bth --wraps='systemctl start bluetooth.service && bluetoothctl' --description 'alias bth=systemctl start bluetooth.service && bluetoothctl'
  systemctl start bluetooth.service && bluetoothctl $argv
        
end
