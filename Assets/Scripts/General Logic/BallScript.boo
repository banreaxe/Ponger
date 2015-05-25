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
			GetComponent[of Rigidbody]().velocity.y = -1.0 * (GetComponent[of Rigidbody]().velocity.y)
		elif collider.tag == "Paddle":
			paddleSpeed = collider.GetComponent[of Rigidbody]().velocity.magnitude
			if paddleSpeed < 2:
				paddleSpeed = 2
			
			GetComponent[of Rigidbody]().velocity.x = -1.0 * (paddleSpeed  / 2.0) * (GetComponent[of Rigidbody]().velocity.x)
			GetComponent[of Rigidbody]().velocity.y = GetComponent[of Rigidbody]().velocity.y * 1.5
		
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
		overSpeedDiff = GetComponent[of Rigidbody]().velocity.magnitude - maxSpeed
		if overSpeedDiff > 0:
			#Debug.Log("Over:$(rigidbody.velocity.magnitude)")
			GetComponent[of Rigidbody]().AddForce((GetComponent[of Rigidbody]().velocity.x * overSpeedDiff) * -1.0, (GetComponent[of Rigidbody]().velocity.y * overSpeedDiff) * -1.0, GetComponent[of Rigidbody]().velocity.x)
		
		underSpeedDiff = minSpeed - GetComponent[of Rigidbody]().velocity.magnitude
		if underSpeedDiff > 0 :
			#Debug.Log("Under:$(rigidbody.velocity.magnitude)")
			GetComponent[of Rigidbody]().AddForce(GetComponent[of Rigidbody]().velocity.x * underSpeedDiff, GetComponent[of Rigidbody]().velocity.y * underSpeedDiff, GetComponent[of Rigidbody]().velocity.x)