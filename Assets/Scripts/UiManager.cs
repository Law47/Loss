using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class UIManager : MonoBehaviour
{
    public static UIManager instance;
    
    [Header("References")]
    private Canvas menu;
    public GameObject debugObject;
    public bool debugMode;

    [Header("Constants")]
    public float textDefaultSize = 22;
    public float textHoverSize = 28;

    public bool inMenu;
    public int hiearchy;

    private void Awake()
    {
        CreateSingleton();

        menu = transform.Find("Menu").gameObject.GetComponent<Canvas>();

        inMenu = false;
        menu.enabled = false;

        textDefaultSize = 22;
        textHoverSize = 28;

        if (!debugMode) {
            debugObject.SetActive(false);
        }
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
        PlayerController player = GameObject.FindFirstObjectByType<PlayerController>();
        player.cameraCanMove = false;
        player.playerCanMove = false;

        menu.enabled = true;
        inMenu = true;
        Time.timeScale = 0;

        Cursor.lockState = CursorLockMode.Confined;
    }

    public void ExitMenu(){
        PlayerController player = GameObject.FindFirstObjectByType<PlayerController>();
        player.cameraCanMove = true;
        player.playerCanMove = true;


        menu.enabled = false;
        inMenu = false;
        Time.timeScale = 1;

        Cursor.lockState = CursorLockMode.Locked;
    }

    public void QuitToMenu(){
        PlayerController player = GameObject.FindFirstObjectByType<PlayerController>();
        player.cameraCanMove = true;
        player.playerCanMove = true;


        menu.enabled = false;
        inMenu = false;
        Time.timeScale = 1;

        SceneManager.LoadScene("MenuScene");
    }

    public void LoadLevel(int level){
        PlayerController player = GameObject.FindFirstObjectByType<PlayerController>();
        player.cameraCanMove = true;
        player.playerCanMove = true;


        menu.enabled = false;
        inMenu = false;
        Time.timeScale = 1;

        Cursor.lockState = CursorLockMode.Locked;

        SceneManager.LoadScene(level);
    }

    private void Update(){
        if (Input.GetKeyDown("escape") && SceneManager.GetActiveScene().buildIndex != 0){
            if (!inMenu) EnterMenu();
            else ExitMenu();
        }
    }
}
