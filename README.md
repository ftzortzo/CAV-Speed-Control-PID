# 🚗 CAV Speed Control using PID Controller

This repository demonstrates a simple **PID-based speed control** of a connected and automated vehicle (CAV) using **MATLAB**.

---

## 📘 Overview

This project serves as an **educational tutorial** on how a Proportional–Integral–Derivative (PID) controller can regulate the **longitudinal velocity** of a CAV modeled as a **double integrator** system.

The vehicle aims to reach a **desired speed** from a given initial condition by computing the appropriate **acceleration command** using PID feedback.

---

## 📐 Mathematical Model

The vehicle follows double integrator dynamics:

$\dot{x}(t) = v(t), \quad \dot{v}(t) = u(t)$

Where:
- $x(t)$: position  
- $v(t)$: speed  
- $u(t)$: acceleration (control input)

The control objective is to drive the speed $v(t)$ to a desired value $v_{\text{ref}}$.

The PID controller computes the control input:

$u(t) = K_p e(t) + K_i \int_0^t e(\tau)d\tau + K_d \frac{de(t)}{dt}$

with:
- $e(t) = v_{\text{ref}} - v(t)$

---

### Proportional Term (P)

- Reacts to the present error
- Large error $\rightarrow$ large correction
- Too high $K_p$ may cause oscillations


$u_P(t) = K_p \cdot e(t)$

### Integral Term (I)

- Reacts to accumulated past error
- Eliminates steady-state error
- Too high $K_i$ may lead to overshoot or instability

  
$u_I(t) = K_i \cdot \int_0^t e(\tau) \, d\tau$

### Derivative Term (D)

- Reacts to the rate of change of the error
- Predicts future error
- Adds damping, helps reduce overshoot


$u_D(t) = K_d \cdot \frac{d e(t)}{d t}$

## 🧪 MATLAB Simulation

The file [`CAV_speed_control.m`](./CAV_speed_control.m) contains the full MATLAB script that:
- Simulates the vehicle for 10 seconds
- Applies PID control to reach target speed
- Plots the speed and control signal (acceleration)

### 🔧 Adjustable Parameters:
- Desired speed: `v_ref`
- PID gains: `Kp`, `Ki`, `Kd`
- Time step and total duration

---

## 📊 Results

The script generates two plots:
- Vehicle **speed over time** converging to the desired value
- The applied **acceleration (control input)** over time

These plots help understand the behavior of each PID component and their combined effect.

---

