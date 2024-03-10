using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class MenuManager : MonoBehaviour
{
    public static MenuManager instance = null;

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
        SceneManager.LoadScene("Level1");
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
