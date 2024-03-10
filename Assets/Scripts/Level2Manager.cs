using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Level2Manager : MonoBehaviour
{
    public static Level2Manager instance = null;

    [Header("GameObject References")]
    public GameObject frontRecept;
    public GameObject backRecept;
    public GameObject player;

    [Header("Constants")]
    public float triggerReceptMovementDistance;
    public float frontReceptOffset;
    public float backReceptOffset;
    public float frontReceptSpeed;

    private float playerMovedDistance;

    private void Awake(){
        if (instance == null)
            instance = this;
        else if (instance != this)
            Destroy(gameObject);

        
        //Check if preinitalized with value
        if (triggerReceptMovementDistance == 0){
            triggerReceptMovementDistance = frontReceptOffset * 2/3;
        }
        if (backReceptOffset == 0){
            backReceptOffset = 20;
        }
        if (frontReceptOffset == 0){
            frontReceptOffset = 20;
        }
        if (frontReceptSpeed == 0){
            frontReceptSpeed = 2f;
        }

        playerMovedDistance = 0;

        //Move Recepts to their offsets
        frontRecept.transform.position = new Vector3(frontRecept.transform.position.x, frontRecept.transform.position.y, 
            playerMovedDistance + frontReceptOffset);
        backRecept.transform.position = new Vector3(backRecept.transform.position.x, backRecept.transform.position.y, 
            playerMovedDistance - backReceptOffset);
    }

    private void Update(){
        //Move Front Receptionist
        if (playerMovedDistance > triggerReceptMovementDistance) {
            frontRecept.transform.position = new Vector3(frontRecept.transform.position.x, frontRecept.transform.position.y, 
                frontReceptOffset + frontReceptSpeed * (playerMovedDistance - triggerReceptMovementDistance));
        }
        //Move Back Receptionist
        backRecept.transform.position = new Vector3(backRecept.transform.position.x, backRecept.transform.position.y, 
            playerMovedDistance - backReceptOffset);

        if (player.transform.position.z > playerMovedDistance){
            playerMovedDistance = player.transform.position.z;
        }
    }
}
