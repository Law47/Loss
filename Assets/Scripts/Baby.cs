using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Baby : MonoBehaviour
{
    public GameObject target;
    public GameObject walls;
    private Animator anim;
    private bool foward = false;
    void Start() {
        anim = walls.GetComponent<Animator>();
    }
    void Update()
    {
        float dist = Vector3.Distance(transform.position, target.transform.position);
        if (dist < 5f) {
            if (!foward) {
                anim.Play("Room Break", 0, 0f);
                foward = true;
            }
            anim.SetFloat("speed", 1/dist); 
        } else {
            if (foward) {
                anim.Play("Room Break", 0, 1f);
                foward = false;
            }
            anim.SetFloat("speed", -1/dist); 
        }
    }
}
