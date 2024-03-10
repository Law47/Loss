using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using TMPro;

public class QuitToMenuButtonScript : MonoBehaviour, IPointerEnterHandler, IPointerExitHandler, IPointerClickHandler
{
    private TextMeshProUGUI textBox;
    private UIManager uIManager;
    public float uIManagerNumber;
    

    private void Awake()
    {
        textBox = gameObject.GetComponentInChildren<TextMeshProUGUI>();
        uIManager = GameObject.FindObjectOfType<UIManager>();
    }

    private void Start()
    {
        textBox.fontSize = uIManager.textDefaultSize;
    }

    public void OnPointerClick(PointerEventData eventData)
    {
        uIManager.QuitToMenu();
    }

    public void OnPointerEnter(PointerEventData eventData)
    {
        textBox.fontSize = uIManager.textHoverSize;
    }

    public void OnPointerExit(PointerEventData eventData)
    {
        textBox.fontSize = uIManager.textDefaultSize;
    }

    private void Update(){
        uIManagerNumber = uIManager.hiearchy;
    }
}