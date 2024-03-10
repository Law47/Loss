using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Menu_SceneManager : MonoBehaviour
{
    public static Menu_SceneManager instance = null;

    [Header("UI Constants")]
    public float textDefaultSize;
    public float textHoverSize;

    [Header("UI Canvas Refrences")]
    public Canvas mainMenuCanvas;
    public Canvas creditsCanvas;

    private void Awake(){
        if (instance == null)
            instance = this;
        else if (instance != this)
            Destroy(gameObject);
        
        textDefaultSize = 22;
        textHoverSize = 28;

        mainMenuCanvas.enabled = true;
        creditsCanvas.enabled = false;
    }

    public void StartGameplayScene(){

    }

    public void ExitGame(){
        Application.Quit();
    }

    public void EnterCredits(){
        mainMenuCanvas.enabled = false;
        creditsCanvas.enabled = true;
    }

    public void ExitCredits(){
        mainMenuCanvas.enabled = true;
        creditsCanvas.enabled = false;
    }
}
