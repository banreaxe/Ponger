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
		#Debug.Log("$(transform.position.y)")
		# y 4.6 = top, -2.3 = bottom
		pass
		
	def FixedUpdate():
		if gameScript.IsMobile():
			axis = mobileInput.AxisV() * 0.75f
		else:
			axis = Input.GetAxisRaw("Vertical")
		force = axis * moveSpeed
		
		if axis != 0:
			rigidbody.AddForce(Vector3(0, force, 0))
		
		speedDiff = rigidbody.velocity.magnitude - maxSpeed
		if speedDiff > 0:
			rigidbody.AddForce(Vector3(0, speedDiff, 0))
		
		
		transform.position.y = Mathf.Clamp(transform.position.y, -2.3, 4.6)