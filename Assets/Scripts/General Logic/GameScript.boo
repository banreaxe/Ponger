import UnityEngine

class GameScript (MonoBehaviour):
""" generic game config settings """
	
	mobile as bool
	paddleCamera as bool = false
	public paused as bool = false
	playerOnRight as bool = true #start player on right side by default
	cameraControl as CameraController
	
	def Start ():		
		
		// setup camera
		cameraControl = GameObject.Find('CameraController').GetComponent('CameraController')
		
		// determine if mobile
		if Application.platform == RuntimePlatform.Android or Application.platform == RuntimePlatform.IPhonePlayer:
			mobile = true
			GameObject.Find('MobileInput').active = false;
		else:
			mobile = false
	
	def Update ():
		pass
	
	def IsMobile():
		return mobile
		
	def InPaddleCamera():
		return paddleCamera
	
	def ToggleCameraMode():
		if InPaddleCamera():
			SetCameraMain()
			paddleCamera = false
		else:
			SetCameraPaddle()
			paddleCamera = true
			
	def SetCameraMain():
		cameraControl.SetCameraMode(0)
	
	def SetCameraPaddle():
		if playerOnRight:
			cameraControl.SetCameraMode(2)
		else:
			cameraControl.SetCameraMode(1)
	
	def GetCameraModeName():
		if InPaddleCamera():
			return "Paddle"
		else:
			return "Main"
	
	def IsPlayerOnRight():
		return playerOnRight
