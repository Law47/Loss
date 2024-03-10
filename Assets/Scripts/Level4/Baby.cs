using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Baby : MonoBehaviour
{
    public GameObject[] walls;
    public GameObject focal;
    public float activeDist;

    void Update() {
        float dist = Vector3.Distance(transform.position, focal.transform.position);
        float percentage = Math.Abs(dist - activeDist) / activeDist;
        foreach (GameObject wall in walls) {
            if (dist < activeDist) {
                Vector3 difference = wall.GetComponent<AnimTarget>().start.position - wall.GetComponent<AnimTarget>().target.position;
                difference *= percentage;
                wall.transform.position = wall.GetComponent<AnimTarget>().start.position - difference;
            }
        }
    }
}
