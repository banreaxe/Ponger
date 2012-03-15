import UnityEngine

class MobileInputScript (MonoBehaviour): 
	
	zeroAc as Vector3
	curAc as Vector3
	sensH as long = 10
	sensV as long = 10
	smooth as long = 0.5
	GetAxisH as long = 0
	GetAxisV as long = 0

	def Start ():
		ResetAxes()
	
	def Update ():
		curAc = Vector3.Lerp(curAc, Input.acceleration-zeroAc, Time.deltaTime/smooth)
		GetAxisV = Mathf.Clamp(curAc.y * sensV, -1, 1)
		GetAxisH = Mathf.Clamp(curAc.x * sensH, -1, 1)
		
	def ResetAxes():
		zeroAc = Input.acceleration
		curAc = Vector3.zero
	
	def AxisH():
		return GetAxisH
	
	def AxisV():
		return GetAxisV
