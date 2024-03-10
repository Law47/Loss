using UnityEngine;
using UnityEngine.SceneManagement;

public class Level3Portal : MonoBehaviour
{
    void OnTriggerEnter(Collider other) {
        if (other.CompareTag("Player")) {
            SceneManager.LoadScene("Level4", LoadSceneMode.Single);
        }
    }
}