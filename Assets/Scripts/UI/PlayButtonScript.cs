using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using TMPro;

public class PlayButtonScript : MonoBehaviour, IPointerEnterHandler, IPointerExitHandler, IPointerClickHandler
{
    private TextMeshProUGUI textBox;
    private MenuManager sceneManager;
    

    private void Awake()
    {
        textBox = gameObject.GetComponentInChildren<TextMeshProUGUI>();
        sceneManager = GameObject.FindFirstObjectByType<MenuManager>();
    }

    private void Start()
    {
        textBox.fontSize = sceneManager.textDefaultSize;
    }

    public void OnPointerClick(PointerEventData eventData)
    {
        sceneManager.StartGameplayScene();
    }

    public void OnPointerEnter(PointerEventData eventData)
    {
        textBox.fontSize = sceneManager.textHoverSize;
    }

    public void OnPointerExit(PointerEventData eventData)
    {
        textBox.fontSize = sceneManager.textDefaultSize;
    }
}