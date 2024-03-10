using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UIManager : MonoBehaviour
{
    public static UIManager instance;
    
    [Header("References")]
    public Canvas menu;

    private bool inMenu;

    private void Awake()
    {
        CreateSingleton();

        inMenu = false;
        menu.enabled = false;
    }

    void CreateSingleton()
    {
        if (instance == null)
            instance = this;
        else
            Destroy(gameObject);

        DontDestroyOnLoad(gameObject);
    }

    public void EnterMenu(){
        menu.enabled = true;
        inMenu = true;
        Time.timeScale = 0;
    }

    public void ExitMenu(){
        menu.enabled = false;
        inMenu = false;
        Time.timeScale = 1;
    }

    private void Update(){
        if (Input.GetKeyDown("escape")){
            if (!inMenu) EnterMenu();
            else ExitMenu();
        }
    }
}
