import UnityEngine

class PaddleScript (MonoBehaviour): 
	
	public moveSpeed as single = 50
	public maxSpeed as single = 50
	gameScript as GameScript 
	mobileInput as MobileInputScript 
	

	def Start ():
		gameScript = gameObject.Find("Game").GetComponent('GameScript')
		mobileInput = gameObject.Find("MobileInput").GetComponent('MobileInputScript')
		
	def Update ():
		#Debug.Log("magnitude: $(rigidbody.velocity.magnitude)")
		pass
		
	def FixedUpdate():
		if gameScript.IsMobile():
			axis = mobileInput.AxisV()
		else:
			axis = Input.GetAxisRaw("Vertical")
		force = axis * moveSpeed
		
		if axis != 0:
			rigidbody.AddForce(Vector3(0, force, 0))
		
		speedDiff = rigidbody.velocity.magnitude - maxSpeed
		if speedDiff > 0:
			rigidbody.AddForce(Vector3(0, speedDiff, 0))
		