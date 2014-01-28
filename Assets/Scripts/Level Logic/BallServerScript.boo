import UnityEngine
/*
Serves a ball either left or right at a random angle if no ball is in play
*/
class BallServerScript (MonoBehaviour): 

	public ballServerActive as bool = false

	public ballToServe as BallScript
	public serveForce as single = 200
	public ballInPlay = false
	directionToServe = -1.0F
	# on x axis, -1.0F for right, 1.0F for left
	
	def Start ():
		pass
	
	def Update ():
		if not ballInPlay and ballServerActive:
			// determine angle
			angle = Random.Range(30.0F, 150.0F)
			transform.Rotate(Vector3(0,0,angle*directionToServe))
			ball as BallScript = Instantiate(ballToServe, transform.position, transform.rotation)
			ball.rigidbody.AddRelativeForce(Vector3.up * 200)
			transform.Rotate(Vector3(0,0,angle*directionToServe*-1.0F))
			ballInPlay = true
			
	def SetDirectionRight():
		directionToServe = -1.0F
	
	def SetDirectionLeft():
		directionToServe = 1.0F
		
	public def BallServerActivate():
		ballServerActive = true;
		
	public def BallServerDeActivate():
		ballServerActive = false;
		