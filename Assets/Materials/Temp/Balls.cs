using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Balls : MonoBehaviour
{
    public Material[] ballMaterials;
    private Material[] newBallMaterials;
    private MeshRenderer renderer;

    void Start(){
        newBallMaterials = new Material[1];

        renderer = gameObject.GetComponent<MeshRenderer>();
        int randomInt = Random.Range(0, ballMaterials.Length);
        for(int i = 0; i < ballMaterials.Length; i++){
            if (randomInt == i){
                newBallMaterials[0] = ballMaterials[i];
            }
        }

        renderer.materials = newBallMaterials;
    }
}
