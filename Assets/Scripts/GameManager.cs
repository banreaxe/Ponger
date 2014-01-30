using UnityEngine;
using System.Collections;

public class GameManager : MonoBehaviour {

	private TitleScreen titleScreen;
	private GameObject ballServer;

	// Use this for initialization
	void Start () {
		GameEventManager.InTheBeginning += InTheBeginning;
		GameEventManager.GamePlayStart += GamePlayStart;
		GameEventManager.GamePlayOver += GamePlayOver;
	
		titleScreen = GameObject.Find("TitleScreen").GetComponent<TitleScreen>();
		ballServer = GameObject.FindGameObjectWithTag ("BallServer");


		GameEventManager.TriggerInTheBeginning();

	}
	
	// Update is called once per frame
	void Update () {
	
	}

	void InTheBeginning()
	{
		// activate title screen
		titleScreen.Activate();
		ballServer.SendMessage ("BallServerDeActivate");
		//ballServer.BallServerDeActivate();
		// ball server disable
	}

	void GamePlayStart()
	{
		Debug.Log ("GamePlayStart Triggered");
		titleScreen.DeActivate();
		// activate gameplay

		ballServer.SendMessage ("BallServerActivate");
		//ballServer.BallServerActivate();
	}

	void GamePlayOver()
	{
		ballServer.SendMessage ("BallServerDeActivate");
		// activate gameover screen
	}
}
