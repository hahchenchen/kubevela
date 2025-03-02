# Rollout Example

Here is an example of how to rollout an application with a component of type CloneSet.

## Install Kruise

```shell 
helm install kruise https://github.com/openkruise/kruise/releases/download/v0.7.0/kruise-chart.tgz
```

## Rollout steps

1. Install CloneSet based workloadDefinition

```shell
kubectl apply -f docs/examples/rollout/clonesetDefinition.yaml
```

2. Apply an application for rolling out
```shell
kubectl apply -f docs/examples/rollout/app-source-prep.yaml
```

3. Modify the application image and apply
```shell
kubectl apply -f docs/examples/rollout/app-target.yaml
```

4. Apply the application rollout that stops at the second batch and mrk the application as normal
```shell
kubectl apply -f docs/examples/rollout/app-rollout-pause.yaml
kubectl apply -f docs/examples/rollout/app-target-done.yaml
```
Check the status of the ApplicationRollout and see the step by step rolling out. This rollout
will pause after the second batch.

5. Apply the application rollout that completes the rollout
```shell
kubectl apply -f docs/examples/rollout/app-rollout-finish.yaml
```

Check the status of the ApplicationRollout and see the rollout completes, and the
ApplicationRollout's "Rolling State" becomes `rolloutSucceed`