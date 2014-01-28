using UnityEngine;
using System.Collections;

public class GameManager : MonoBehaviour {

	public TitleScreen titleScreen;
	public BallServerScript ballServer;

	// Use this for initialization
	void Start () {
		GameEventManager.InTheBeginning += InTheBeginning;
		GameEventManager.GamePlayStart += GamePlayStart;
		GameEventManager.GamePlayOver += GamePlayOver;
	
		titleScreen = GameObject.Find("TitleScreen").GetComponent<TitleScreen>();
		ballServer = GameObject.Find ("BallServer").GetComponent<BallServerScript>();


		GameEventManager.TriggerInTheBeginning();

	}
	
	// Update is called once per frame
	void Update () {
	
	}

	void InTheBeginning()
	{
		// activate title screen
		titleScreen.Activate();
		//SendMessage ("BallServerDeActivate");
		ballServer.BallServerDeActivate();
		// ball server disable
	}

	void GamePlayStart()
	{
		Debug.Log ("GamePlayStart Triggered");
		titleScreen.DeActivate();
		// activate gameplay

		//SendMessage ("BallServerActivate");
		ballServer.BallServerActivate();
	}

	void GamePlayOver()
	{
		SendMessage ("BallServerDeActivate");
		// activate gameover screen
	}
}
