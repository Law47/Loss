using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Handle : MonoBehaviour
{
    public int dir;
    private GameObject table;
    private float init;
    void Start()
    {
        table = transform.parent.gameObject;
    }

    public void ReportInitial(float rot) {
        if (rot >= 270f) {
            rot -= 360f;
        }
        init = rot;
    }

    public void ReportAngle(float rot) {
        if (dir == 0) {
            if (rot > init) {
                table.transform.Rotate(0f, 0.2f, 0f);
            }
            if (rot < init) {
                table.transform.Rotate(0f, -0.2f, 0f);
            }
        }
        if (dir == 1) {
            if (rot > init) {
                table.transform.Rotate(-0.2f, 0f, 0f);
            }
            if (rot < init) {
                table.transform.Rotate(0.2f, 0f, 0f);
            }
        }
        if (dir == 2) {
            if (rot > init) {
                table.transform.Rotate(0f, -0.2f, 0f);
            }
            if (rot < init) {
                table.transform.Rotate(0f, 0.2f, 0f);
            }
        }
        if (dir == 3) {
            if (rot > init) {
                table.transform.Rotate(0.2f, 0f, 0f);
            }
            if (rot < init) {
                table.transform.Rotate(-0.2f, 0f, 0f);
            }
        }
        if (table.transform.rotation.x < -77f) {
            table.transform.rotation = Quaternion.Euler(77f, table.transform.rotation.y, table.transform.rotation.z);
        }
    }
}
