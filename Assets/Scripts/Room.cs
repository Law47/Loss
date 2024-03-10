using System.Collections;
using System.Collections.Generic;
using System.Data;
using UnityEngine;

public class Room : MonoBehaviour
{
    public GameObject[] connectors;
    private GameObject[] children;
    
    public void Generate() {
        children = new GameObject[connectors.Length];
        for (int i = 0; i < connectors.Length; i++) {
            int doors;
            doors = Random.Range(0, 3);
            switch (doors) {
            case 0:
                doors = 1;
                break;
            case 1:
                doors = 3;
                break;
            case 2:
                doors = 4;
                break;
            }
            children[i] = Instantiate((GameObject)Resources.Load("Rooms/" + doors + "/" + Random.Range(0,1).ToString()), connectors[i].transform.position, connectors[i].transform.rotation);
            Destroy(connectors[i]);
        }
    }

    public void Despawn(int dont) {
        for (int i = 0; i < children.Length; i++) {
            if (i != dont) {
                Destroy(children[i]);
            }
        }
        Destroy(gameObject);
    }
}
