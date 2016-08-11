import os
import json  
import md5

files = os.listdir("./")
ignoreFiles = [
	"version.json",
	"versionBuild.py",
	"MB"
]
versionData = {}
versionData["downLoadHost"] ="https://github.com/NightFarmer/CloudApp/raw/master/app/src/main/assets/"
versionData["fileList"] = []
for fileName in files:
	if fileName not in ignoreFiles:
		st_mtime=os.stat("./"+fileName).st_mtime
		versionData["fileList"].append({"name":fileName,"version":st_mtime})

#print(versionData)
#print(json.dumps(versionData))
versionDataJson = json.dumps(versionData, indent=4)
m1 = md5.new()   
m1.update(versionDataJson)   
versionData["versionCode"] = m1.hexdigest()

output = open('version.json', 'w')
output.write(json.dumps(versionData, indent=4))
output.close( )


