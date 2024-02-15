import os

def dir_with_sort(directory):
    def get_creation_time(item):
        item_path = os.path.join(directory, item)
        return os.path.getctime(item_path)

    items = os.listdir(directory)
    sorted_items = sorted(items, key=get_creation_time)
    return sorted_items


walldirpath = "/home/rintarou/wallpapers/"
walldir = dir_with_sort(walldirpath)

for i in range(len(walldir)):
    walldir[i] = walldirpath + walldir[i]

bash = open("/home/rintarou/tools/wall-setup/setwall.sh", "r")
wallisusing = bash.read().split()[2]
bash.close()
bash = open("/home/rintarou/tools/wall-setup/setwall.sh", "w")
bash.write("swaybg -i " + walldir[(walldir.index(wallisusing) + 1) % len(walldir)])
bash.close()
os.system("pkill swaybg")
os.system(" sh /home/rintarou/tools/wall-setup/setwall.sh &")
change_complete_output = "echo your wallpaper now is: " + wallisusing
#print(change_complete_output)
os.system(change_complete_output) 
