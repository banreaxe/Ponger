import UnityEngine

class GuiManager (MonoBehaviour): 

	public xpos = 273
	public ypos = 78
	public xsize = 112
	public ysize = 50
	gameScript as GameScript
	cameraControl as CameraController
	
	def Start ():
		gameScript = gameObject.Find("Game").GetComponent('GameScript')
		#cameraControl = gameObject.Find("CameraController").GetComponent('CameraController')
	
	def Update ():
		pass

	def OnGUI():
		if GUI.Button(Rect(380,10,75,50),"Menu"):
			if not gameScript.paused:
				PauseGame()
			else:
				UnpauseGame()
		if gameScript.paused:
			ShowPauseMenu()
			
	def PauseGame():
		gameScript.paused = true
		Time.timeScale = 0
	
	def UnpauseGame():
		gameScript.paused = false
		Time.timeScale = 1
		
	def ShowPauseMenu():
		
		if GUI.Button(Rect(300,78,175,50),"Camera Mode: $(gameScript.GetCameraModeName())"):
			gameScript.ToggleCameraMode()
		
			

	