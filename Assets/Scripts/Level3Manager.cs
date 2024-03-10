using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Level3Manager : MonoBehaviour
{
    public static Level3Manager instance = null;

    [Header("GameObject Refrences")]
    public GameObject wall;
    public GameObject player;

    [Header("Constants")]
    public float wallOffset;

    private float playerMovedDistance;

    private void Awake(){
        if (instance == null)
            instance = this;
        else if (instance != this)
            Destroy(gameObject);
        
        if (wallOffset == 0){
            wallOffset = 30;
        }

        wall.transform.position = new Vector3(wall.transform.position.x, wall.transform.position.y, playerMovedDistance - wallOffset);
    }

    private void Update(){
        wall.transform.position = new Vector3(wall.transform.position.x, wall.transform.position.y, playerMovedDistance - wallOffset);

        if (player.transform.position.z > playerMovedDistance) {
            playerMovedDistance = player.transform.position.z;
        }
    }
}
