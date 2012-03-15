import UnityEngine

class GameScript (MonoBehaviour):
""" generic game config settings """
	
	mobile as bool
	
	def Start ():
		if Application.platform == RuntimePlatform.Android or Application.platform == RuntimePlatform.IPhonePlayer:
			mobile = true
		else:
			mobile = false
	
	def Update ():
		pass
	
	def IsMobile():
		return mobile
