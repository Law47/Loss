using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;

public class Coll : MonoBehaviour
{
    public int dir; // 0 N, 1 E, 2 S, 3 W
    private void OnTriggerEnter(Collider other) {
        if (other.CompareTag("Player")) {
            transform.parent.GetComponent<Room>().Generate();
        }
    }

    private void OnTriggerExit(Collider other) {
        if (other.CompareTag("Player")) {
            transform.parent.GetComponent<Room>().Despawn(dir);
        }
    }
}
