using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using TMPro;

public class DebugSceneButtonScript : MonoBehaviour, IPointerEnterHandler, IPointerExitHandler, IPointerClickHandler
{
    private TextMeshProUGUI textBox;
    private UIManager uIManager;
    public float uIManagerNumber;

    public int levelNumber;
    

    private void Awake()
    {
        textBox = gameObject.GetComponentInChildren<TextMeshProUGUI>();
        uIManager = GameObject.FindObjectOfType<UIManager>();

        if (levelNumber == 0){
            levelNumber = 1;
        }
    }

    private void Start()
    {
        textBox.fontSize = uIManager.textDefaultSize;
    }

    public void OnPointerClick(PointerEventData eventData)
    {
        uIManager.LoadLevel(levelNumber);
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