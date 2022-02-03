using Agents
using GLMakie
using InteractiveDynamics

model, flocking_agent_step!, flocking_model_step! = Models.flocking()
Bird = valtype(model.agents)

const bird_polygon = Polygon(Point2f[(-0.5, -0.5), (1, 0), (-0.5, 0.5)])
function bird_marker(b::Bird)
    φ = atan(b.vel[2], b.vel[1]) #+ π/2 + π
    scale(rotate2D(bird_polygon, φ), 2)
end

abm_play(
    model, flocking_agent_step!, flocking_model_step!;
    am = bird_marker,
    title = "Flocking"
)