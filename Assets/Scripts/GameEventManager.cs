using System;
using UnityEngine;

public static class GameEventManager
{
	public delegate void GameEvent();
	public static event GameEvent InTheBeginning, GamePlayStart, GamePlayOver;

	public static void TriggerInTheBeginning()
	{
		if (InTheBeginning != null)
			InTheBeginning();
	}

	public static void TriggerGamePlayStart()
	{
		if (GamePlayStart != null)
			GamePlayStart();
	}

	public static void TriggerGamePlayOver()
	{
		if(GamePlayOver != null)
			GamePlayOver();
	}
}

