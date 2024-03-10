using UnityEngine;
using UnityEngine.SceneManagement;

public class Level2Portal : MonoBehaviour
{
    void OnTriggerEnter(Collider other) {
        if (other.CompareTag("Player")) {
            SceneManager.LoadScene("Level3", LoadSceneMode.Single);
        }
    }
}
