import UnityEngine

class CameraController (MonoBehaviour): 

	camera_modes = ('main', 'left', 'right')
	public camera_mode = 0
	public maincam as GameObject
	public leftcam as GameObject
	public rightcam as GameObject
	
	def Start ():
		SetCameraMode(camera_mode)
	
	def Update ():
		pass
		
	def SetCameraMode(new_mode):
		camera_mode = new_mode
		
		if camera_mode == 0:
			maincam.active = true
			leftcam.active = false
			rightcam.active = false
		elif camera_mode == 1:
			maincam.active = false
			leftcam.active = true
			rightcam.active = false
		elif camera_mode == 2:
			maincam.active = false
			leftcam.active = false
			rightcam.active = true
	
