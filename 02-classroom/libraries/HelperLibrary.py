from robot.api.deco import keyword, library

import random

@library
class HelperLibrary():
	ROBOT_LIBRARY_SCOPE = 'SUITE'
	ROBOT_AUTO_KEYWORDS = False

	@keyword
	def random_number(self, min, max):
		num = random.randint(min, max)
		return num