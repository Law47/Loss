using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CollHelper : MonoBehaviour
{
    public int d;
    public GameObject mainColl;
    private void OnTriggerEnter(Collider other) {
        if (other.CompareTag("Player")) {
            mainColl.GetComponent<Coll>().dir = d;
        }
    }
}