using UnityEngine;
using System.Collections;

public class TitleScreen : MonoBehaviour {

	public GUIText PongerText, InstructionText1, InstructionText2, InstructionText3;

	public bool titleScreenActive = false;

	// Use this for initialization
	void Start () {

	}
	
	// Update is called once per frame
	void Update () {
	
		// if on title screen, check for any key press to start game
		if (titleScreenActive)
			if(Input.anyKeyDown)
				GameEventManager.TriggerGamePlayStart();

	}

	public void Activate()
	{
		PongerText.enabled = true;
		InstructionText1.enabled = true;
		InstructionText2.enabled = true;
		InstructionText3.enabled = true;

		titleScreenActive = true;


	}

	public void DeActivate()
	{
		PongerText.enabled = false;
		InstructionText1.enabled = false;
		InstructionText2.enabled = false;
		InstructionText3.enabled = false;

		titleScreenActive = false;
	}


}
