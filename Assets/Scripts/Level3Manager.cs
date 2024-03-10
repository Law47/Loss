using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Level3Manager : MonoBehaviour
{
    public static Level3Manager instance = null;

    private void Awake(){
        if (instance == null)
            instance = this;
        else if (instance != this)
            Destroy(gameObject);
    }
}
