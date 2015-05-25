import UnityEngine

class ScoreKeeperScript (MonoBehaviour): 

	_scoreLeft as int = 0
	_scoreRight as int = 0
	
	def Start ():
		pass
	
	def Update ():
		pass

	def OnGUI():
		GameObject.FindGameObjectWithTag("ScoreLeft").GetComponent[of GUIText]().text = _scoreLeft.ToString()
		GameObject.FindGameObjectWithTag("ScoreRight").GetComponent[of GUIText]().text = _scoreRight.ToString()
	
	def PointLeft():
		_scoreLeft += 1
	
	def PointRight():
		_scoreRight += 1