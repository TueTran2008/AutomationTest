from robot.api.deco import keyword, library
import json


@library(scope='GLOBAL', version='1.0')
class JSONLibrary():

    @keyword
    def parse_json_file(self, file_path):
        f = open(file_path)
        #json.load(f)
        # for i in data['emp_detauls']:
        # 	print(i)
		# f.close()
        return json.load(f)
