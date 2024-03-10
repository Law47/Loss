using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Coll : MonoBehaviour
{
    private void OnTriggerEnter(Collider other) {
        transform.parent.GetComponent<Room>().Generate();
    }

    private void OnTriggerExit(Collider other) {
        Destroy(transform.parent);
    }
}
