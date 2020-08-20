# encoding: UTF-8

module ::Math

  module Physics

    # `information`/`disturbance`/`variation` traveling w/ an `oscillating` pattern
    #
    # | sub-type            | details                                                                                                           |
    # | ------------------- | ----------------------------------------------------------------------------------------------------------------- |
    # | `transverse wave`   | moving wave w/ `oscillations` occurring `perpendicular` to the direction of travel                                |
    # | `longitudinal wave` | moving wave w/ `oscillations` occurring `parallel` to the direction of travel                                     |
    # | `standing wave`     | non-moving wave despite current `oscillations`                                                                    |
    # | `solitary wave`     | wikipedia - "a self-reinforcing `wave packet` that maintains its shape while it propagates at a constant velocity. Solitons are caused by a cancellation of `nonlinear` and `dispersive effects` in the medium" |
    # | `light wave`        | can move through space no problem; displays properties of both `wave` & `particle` called `wave-particle duality` |
    #
    # | term                    | details                                                                           | source |
    # | ----------------------- | --------------------------------------------------------------------------------- | ------ |
    # | `period`                | "the time it takes between one `peak` and the next one"                           | 0x0    |
    # | `amplitude`             | magnitude of distance covered between the `maxima` and `minima` points reached from one full iteration/cycle | 0x0    |
    # | `oscillate`             | "to swing back and forth with a steady, uninterrupted rhythm"                     | 0x1    |
    # | `hertz`                 | frequency (cycle repeats per second)                                              | 0x1    |
    # | `wave packet`           | "a short `burst` or `envelope` of localized wave action that travels as a unit"   | 0x5    |
    # | `λ` -> `wavelength`     | "distance between adjacent maxima or minima of a wave"                            | 0x4    |
    # | `periodic`/`continuous` | repeats over space & time                                                         | 0x4    |
    # | `crest`/`peak`          | value/position/point of the largest magnitude reached                             | 0x4    |
    # | `trough`                | value/position/point of the lowest magnitude reached                              | 0x4    |
    # | `expansion`             | "a point of maximum spacing between particles of a medium for longitudinal waves" | 0x4    |
    # | `compression`           | "a point of minimum spacing between particles of a medium for longitudinal waves" | 0x4    |
    # | `⨍` -> `frequency`      | `V` / `λ`                                                                         | 0x4    |
    #
    # | equation        | context                                             | misc               |
    # | --------------- | -------------------------------------------------   | ------------------ |
    # | `λ` = `V` / `⨍` | `λ`:`wavelength`, `v`:`wave speed`, `⨍`:`frequency` | source from{`0x4`} |
    class Wave

    end

  end

end

#         __    __               __               __
#        /\ \__/\ \__         __/\ \             /\ \__  __
#    __  \ \ ,_\ \ ,_\  _ __ /\_\ \ \____  __  __\ \ ,_\/\_\    ___     ___     ____  __
#  /'__`\ \ \ \/\ \ \/ /\`'__\/\ \ \ '__`\/\ \/\ \\ \ \/\/\ \  / __`\ /' _ `\  /',__\/\_\
# /\ \L\.\_\ \ \_\ \ \_\ \ \/ \ \ \ \ \L\ \ \ \_\ \\ \ \_\ \ \/\ \L\ \/\ \/\ \/\__, `\/_/_
# \ \__/.\_\\ \__\\ \__\\ \_\  \ \_\ \_,__/\ \____/ \ \__\\ \_\ \____/\ \_\ \_\/\____/ /\_\
#  \/__/\/_/ \/__/ \/__/ \/_/   \/_/\/___/  \/___/   \/__/ \/_/\/___/  \/_/\/_/\/___/  \/_/
#
# | #    | source URL                                                                         |
# | ---- | ---------------------------------------------------------------------------------- |
# | 0x0  | https://study.com/academy/lesson/wave-parameters-wavelength-amplitude-period-frequency-speed.html  |
# | 0x1  | https://www.sciencenewsforstudents.org/article/explainer-understanding-waves-and-wavelengths |
# | 0x2  | https://simple.wikipedia.org/wiki/Wave_(physics) |
# | 0x3  | https://en.wikipedia.org/wiki/Soliton |
# | 0x4  | https://www.khanacademy.org/science/ap-physics-1/ap-mechanical-waves-and-sound/wave-characteristics-ap/a/wave-characteristics-review-ap-physics-1 |
# | 0x5  | https://en.wikipedia.org/wiki/Wave_packet |
