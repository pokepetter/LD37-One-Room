import UnityEngine

class EndButton (MonoBehaviour):
    
    public anim as Animator
    public beepAudio as AudioSource
    public deathAudio as AudioSource
    private ended as bool

    def OnMouseDown() as IEnumerator:
        transform.parent = null
        anim.SetBool("Visible", false)
        beepAudio.volume = 0
        deathAudio.Play()
        yield WaitForSeconds(3f)
        ended = true

    def FixedUpdate():
        if ended:
            deathAudio.volume = Mathf.Lerp(deathAudio.volume, 0f, Time.deltaTime * 1f)
