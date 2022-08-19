import time

start_all()

machine.start()

# let the system boot up
machine.wait_for_unit("multi-user.target")

for i in range(10 * 60 * 2):
    try:
        machine.succeed("systemctl is-active certmgr.service")
    except:
        print("The current time is:", i)
        time.sleep(0.5)

machine.succeed("systemctl is-active certmgr.service")
