using UnityEngine;
using UnityEngine.SceneManagement;

public class Level1Portal : MonoBehaviour
{
    private void OnTriggerEnter(Collider other) {
        SceneManager.LoadScene("Level2", LoadSceneMode.Single);
    }
}
