using System.Collections;
using System.Collections.Generic;
using System.Data;
using UnityEngine;

public class Room : MonoBehaviour
{
    public GameObject[] connectors;
    void Start()
    {
        Generate();
    }
    
    public void Generate() {
        foreach (GameObject connector in connectors) {
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
            Instantiate((GameObject)Resources.Load("Rooms/" + doors + "/" + Random.Range(0,1).ToString()), connector.transform.position, connector.transform.rotation);
            Destroy(connector);
        }
    }
}
