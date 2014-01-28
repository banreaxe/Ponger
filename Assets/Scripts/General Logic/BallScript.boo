import UnityEngine

class BallScript (MonoBehaviour): 
	
	#public startForce as single = 100
	public maxSpeed as single = 10
	public minSpeed as single = 2
	public scoreKeeper as ScoreKeeperScript
	public ballServer as BallServerScript
	
	def Start ():
		pass
	
	def Update ():
		pass
	
	def FixedUpdate():
		SpeedLimits()
		
		
	#def OnCollisionEnter(collision as Collision):
	#	pass
	
	def OnTriggerEnter(collider as Collider):
		
		if collider.tag == "Wall":
			rigidbody.velocity.y = -1.0 * (rigidbody.velocity.y)
		elif collider.tag == "Paddle":
			paddleSpeed = collider.rigidbody.velocity.magnitude
			if paddleSpeed < 2:
				paddleSpeed = 2
			
			rigidbody.velocity.x = -1.0 * (paddleSpeed  / 2.0) * (rigidbody.velocity.x)
			rigidbody.velocity.y = rigidbody.velocity.y * 1.5
		
		if collider.tag == "GoalZoneLeft":
			sk = GameObject.Find("ScoreKeeper").GetComponent[of ScoreKeeperScript]()
			sk.PointRight()
			
			bs = GameObject.Find("BallServer").GetComponent[of BallServerScript]()
			bs.ballInPlay = false
			bs.SetDirectionRight()
			Destroy(gameObject)
			
		elif collider.tag == "GoalZoneRight":
			sk = GameObject.Find("ScoreKeeper").GetComponent[of ScoreKeeperScript]()
			sk.PointLeft()
			
			bs = GameObject.Find("BallServer").GetComponent[of BallServerScript]()
			bs.ballInPlay = false
			bs.SetDirectionLeft()
			Destroy(gameObject)
			
	
	def SpeedLimits():
		#TODO Debug These
		overSpeedDiff = rigidbody.velocity.magnitude - maxSpeed
		if overSpeedDiff > 0:
			#Debug.Log("Over:$(rigidbody.velocity.magnitude)")
			rigidbody.AddForce((rigidbody.velocity.x * overSpeedDiff) * -1.0, (rigidbody.velocity.y * overSpeedDiff) * -1.0, rigidbody.velocity.x)
		
		underSpeedDiff = minSpeed - rigidbody.velocity.magnitude
		if underSpeedDiff > 0 :
			#Debug.Log("Under:$(rigidbody.velocity.magnitude)")
			rigidbody.AddForce(rigidbody.velocity.x * underSpeedDiff, rigidbody.velocity.y * underSpeedDiff, rigidbody.velocity.x)