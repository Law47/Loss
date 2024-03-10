using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class UIManager : MonoBehaviour
{
    public static UIManager instance;
    
    [Header("References")]
    private Canvas menu;

    public bool inMenu;
    public int hiearchy;

    private void Awake()
    {
        CreateSingleton();

        menu = transform.Find("Menu").gameObject.GetComponent<Canvas>();

        inMenu = false;
        menu.enabled = false;
    }

    void CreateSingleton()
    {
        hiearchy = SceneManager.GetActiveScene().buildIndex;
        if (instance == null)
            instance = this;
        else
            if (instance.hiearchy < hiearchy)
                Destroy(gameObject);
            else if (instance.hiearchy == hiearchy)
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
